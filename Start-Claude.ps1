# 1. Load the auth token securely from the .env file
foreach ($line in Get-Content .\.env) {
    if ($line -match "^ANTHROPIC_AUTH_TOKEN=(.*)$") {
        $env:ANTHROPIC_AUTH_TOKEN = $matches[1]
    }
}

# 2. Set the OpenRouter routing overrides
$env:ANTHROPIC_BASE_URL = "https://openrouter.ai/api"
$env:ANTHROPIC_API_KEY = "" # Must be explicitly blanked out to prevent Anthropic conflicts

# 3. Launch the agent with the Qwen 3 Coder free model
claude --model "nvidia/nemotron-3-super-120b-a12b:free"

# 4. Wipe the session memory when you exit the agent
$env:ANTHROPIC_AUTH_TOKEN = ""
$env:ANTHROPIC_BASE_URL = ""