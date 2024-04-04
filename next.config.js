/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack: function(config) {
    config.module.rules.push({
      test: /\.md$/,
      use: 'raw-loader',
    })
    return config
  },
  env: {
    siteTitle: 'Secure GPT for OpenAI',
    maxFileUploadCount: 10,
  },
  trailingSlash: true,
  experimental: {
      appDir: true,
  },
};
  
module.exports = nextConfig;
