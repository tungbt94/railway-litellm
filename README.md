# LiteLLM API Gateway

One-click deploy of [LiteLLM](https://litellm.ai) on Railway -- a universal API gateway for 100+ LLM providers with OpenAI-compatible endpoints, spend tracking, rate limiting, and load balancing.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/TEMPLATE_CODE)

## Services Included

- **LiteLLM Proxy** -- API gateway with admin UI, virtual keys, and usage analytics
- **PostgreSQL** -- Stores API keys, spend logs, model configurations, and user data
- **Redis** -- Response caching and rate limiting

## Environment Variables

### Required

| Variable | Description | Default |
|----------|-------------|---------|
| `LITELLM_MASTER_KEY` | Admin API key (must start with `sk-`) | Auto-generated |
| `LITELLM_SALT_KEY` | Encryption key for stored API keys (do not change after setup) | Auto-generated |
| `DATABASE_URL` | PostgreSQL connection string | Auto-configured |

### LLM Provider Keys (add the ones you need)

| Variable | Description |
|----------|-------------|
| `OPENAI_API_KEY` | OpenAI API key |
| `ANTHROPIC_API_KEY` | Anthropic API key |
| `AZURE_API_KEY` | Azure OpenAI API key |
| `AZURE_API_BASE` | Azure OpenAI endpoint URL |
| `COHERE_API_KEY` | Cohere API key |
| `MISTRAL_API_KEY` | Mistral API key |
| `GROQ_API_KEY` | Groq API key |
| `GEMINI_API_KEY` | Google Gemini API key |
| `AWS_ACCESS_KEY_ID` | AWS access key (for Bedrock) |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key (for Bedrock) |
| `AWS_REGION_NAME` | AWS region (for Bedrock) |

### Optional

| Variable | Description | Default |
|----------|-------------|---------|
| `REDIS_HOST` | Redis hostname | Auto-configured |
| `REDIS_PORT` | Redis port | Auto-configured |
| `REDIS_PASSWORD` | Redis password | Auto-configured |
| `NUM_WORKERS` | Number of proxy workers | `(auto)` |
| `STORE_MODEL_IN_DB` | Store model config in database | `True` |

## Post-Deployment

1. Visit your LiteLLM URL to access the Admin UI
2. Log in with your `LITELLM_MASTER_KEY`
3. Add models via the UI or API (models are stored in the database when `STORE_MODEL_IN_DB=True`)
4. Create virtual API keys for your applications
5. Point your apps to `https://your-litellm-url/v1/` as the OpenAI base URL

## Adding Models

### Via Admin UI
Navigate to your LiteLLM URL and use the model management interface.

### Via API
```bash
curl -X POST https://your-litellm-url/model/new \
  -H "Authorization: Bearer sk-your-master-key" \
  -H "Content-Type: application/json" \
  -d '{
    "model_name": "gpt-4o",
    "litellm_params": {
      "model": "openai/gpt-4o",
      "api_key": "sk-your-openai-key"
    }
  }'
```

### Via Config File
Edit `config.yaml` in the repo and redeploy.

## Links

- [LiteLLM Documentation](https://docs.litellm.ai/)
- [Supported Providers](https://docs.litellm.ai/docs/providers)
- [Source Code](https://github.com/BerriAI/litellm)
