#!/bin/bash
jq -r '.builds[].artifact_id' manifest.json > output.txt
