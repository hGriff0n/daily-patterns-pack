#!/bin/bash
# Copied from https://github.com/rlancemartin/claude-diary
# Auto-generate diary entry before Claude Code compacts conversation
# This hook runs automatically before compact operations (natural session checkpoints)

echo "📝 Auto-generating diary entry before compact..."
echo "/daily:log"