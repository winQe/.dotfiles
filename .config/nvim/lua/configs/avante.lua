return {
  -- this file can contain specific instructions for your project
  instructions_file = "avante.md",
  -- for example
  provider = "claude",
  providers = {
    claude = {
      endpoint = "https://litellm.ml.goodnotesbeta.com",
      model = "claude-sonnet-4-5",
      timeout = 30000, -- Timeout in milliseconds
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 64000,
      },
    },
    moonshot = {
      endpoint = "https://api.moonshot.ai/v1",
      model = "kimi-k2-0711-preview",
      timeout = 30000, -- Timeout in milliseconds
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 32768,
      },
    },
  },
}
