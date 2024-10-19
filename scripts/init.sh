#!/bin/bash

# Function to check if Neo4j is ready
check_neo4j() {
  cypher-shell -u neo4j -p neo4j 'RETURN 1' > /dev/null 2>&1
  return $?
}

# Wait for Neo4j to be ready
until check_neo4j; do
  echo "Waiting for Neo4j to start..."
  sleep 5
done

# Set up constraints
cypher-shell -u neo4j -p neo4j 'CREATE CONSTRAINT ON (p:Person) ASSERT p.id IS UNIQUE;'

# Load CSV data into Neo4j
cypher-shell -u neo4j -p neo4j 'LOAD CSV WITH HEADERS FROM "file:///sample_data.csv" AS row
MERGE (p:Person {id: row.id})
SET p.name = row.name,
    p.department = row.department,
    p.salary = toInteger(row.salary),
    p.city = row.city;'
