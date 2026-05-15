#!/usr/bin/env bash
set -e

SB_DIR="$(cd "$(dirname "$0")" && pwd)"
OPENCODE_DIR="$HOME/.config/opencode"
AGENT_TARGET="$OPENCODE_DIR/agent/system-builder"
COMMAND_TARGET="$OPENCODE_DIR/command"
CONTEXT_TARGET="$OPENCODE_DIR/context/system-builder"

echo ""
echo "============================================================"
echo " SystemBuilder — Installation"
echo "============================================================"
echo ""

echo "[1/5] Creating directories..."
mkdir -p "$AGENT_TARGET" "$CONTEXT_TARGET/concepts" "$CONTEXT_TARGET/guides" "$CONTEXT_TARGET/lookup" "$CONTEXT_TARGET/examples" "$CONTEXT_TARGET/errors"

echo "[2/5] Installing agent..."
cp "$SB_DIR/agent/system-builder.md" "$AGENT_TARGET/"

echo "[2.5/5] Installing subagents..."
mkdir -p "$OPENCODE_DIR/agent/subagents/knowledge"
cp "$SB_DIR/agent/knowledge-synthesizer-subagent.md" "$OPENCODE_DIR/agent/subagents/knowledge/knowledge-synthesizer.md"
cp "$SB_DIR/agent/system-builder-subagent.md" "$OPENCODE_DIR/agent/subagents/knowledge/system-builder.md"

echo "[3/5] Installing command..."
cp "$SB_DIR/command/system.md" "$COMMAND_TARGET/"

echo "[4/5] Installing context..."
cp -r "$SB_DIR/context/"* "$CONTEXT_TARGET/"

echo "[5/5] Verifying..."
if [ -f "$AGENT_TARGET/system-builder.md" ] && [ -f "$COMMAND_TARGET/system.md" ]; then
    echo ""
    echo "============================================================"
    echo "  ✅ SystemBuilder installed successfully!"
    echo "============================================================"
    echo ""
    echo "  /system build a {system_type} on {topic}"
else
    echo "  ❌ Installation incomplete."
    exit 1
fi
echo ""
echo "Done."
