name: CI/CD to Render (Staging + Prod)

on:
  push:
    branches: [ "main" ]

jobs:
  staging:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    # Deploy automatically to staging
    - name: Deploy to Staging
      run: |
        curl -X POST \
          -H "Accept: application/json" \
          -H "Authorization: Bearer ${{ secrets.RENDER_API_KEY }}" \
          -H "Content-Type: application/json" \
          -d '{"serviceId": "${{ secrets.RENDER_STAGING_ID }}"}' \
          https://api.render.com/v1/services/${{ secrets.RENDER_STAGING_ID }}/deploys

  production:
    needs: staging
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://my-ci-app-prod.onrender.com   # optional: nice GitHub link
    steps:
    - name: Deploy to Production (manual approval required)
      run: |
        curl -X POST \
          -H "Accept: application/json" \
          -H "Authorization: Bearer ${{ secrets.RENDER_API_KEY }}" \
          -H "Content-Type: application/json" \
          -d '{"serviceId": "${{ secrets.RENDER_PROD_ID }}"}' \
          https://api.render.com/v1/services/${{ secrets.RENDER_PROD_ID }}/deploys
