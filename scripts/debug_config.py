#!/usr/bin/env python3
"""Debug config query"""
import requests
import json

API_URL = "http://localhost:3000"
API_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkM2RiODc2ZC02MmY0LTRkOTctOWE1Yy00NDA1Y2JlNjJiMjIiLCJ0eXBlIjoiQVBJX0tFWSIsIndvcmtzcGFjZUlkIjoiZDNkYjg3NmQtNjJmNC00ZDk3LTlhNWMtNDQwNWNiZTYyYjIyIiwiaWF0IjoxNzY3NjQ5MTkwLCJleHAiOjQ5MjEyNDkxODksImp0aSI6Ijc3NDhiOWNjLThkYjUtNGQ3ZC1iZTRjLTNhMjcwZWQ0ZGI4ZCJ9.VLL_wihgL3KAuBMtByV3rJ2RG0bDPqwxstdcCcAu0_4"

HEADERS = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

query = """
query {
  getConfigVariablesGrouped {
    groups {
      name
      description
      isHiddenOnLoad
      variables {
        name
        value
        description
        isSensitive
        source
        isEnvOnly
        type
      }
    }
  }
}
"""

payload = {"query": query}
response = requests.post(f"{API_URL}/graphql", headers=HEADERS, json=payload)
print(f"Status: {response.status_code}")
print(f"Response: {response.text[:5000]}")
