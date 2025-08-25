const request = require('supertest')
const express = require('express')

const app = express()
app.get('/', (req, res) => {
    res.send('Hello CI/CD 🚀')
})

test("GET / should return Hello CI/CD 🚀", async () => {
    const res = await request(app).get('/')
    expect(res.statusCode).toBe(200)
    expect(res.text).toBe('Hello CI/CD 🚀')
})