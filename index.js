const express = require('express')
const app = express()

const PORT = 3000;

app.get('/', (req, res) => {
    res.send("Hello CI/CD 🚀... Learning from scratch !!!")
})

app.get("/success",(req,res)=>{
    res.send("Successfully deployed to Render 🚀")
})

app.listen(PORT, () => {
    console.log(`Server running on PORT ${PORT}`);
})
