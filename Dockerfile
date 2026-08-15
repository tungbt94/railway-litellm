# Keep the proxy on the same LiteLLM generation as the ADK client.  The old
# v1.82.3 image can retry Gemini 500s, but immediately replays the request and
# has known streaming/error-path regressions with ADK 2 payloads.
FROM ghcr.io/berriai/litellm-database:v1.96.2

COPY --chmod=755 entrypoint.sh /app/entrypoint.sh
COPY config.yaml /app/config.yaml

EXPOSE 4000

ENTRYPOINT ["/app/entrypoint.sh"]
