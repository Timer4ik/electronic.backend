require("dotenv").config()
const express = require("express")
const cors = require("cors")
const db = require("./db.js")

const router = require("./src/routes/index")
const { Category, SubCategory, Product } = require("./src/models/models.js")
const app = express()
const PORT = process.env.PORT || 5001

app.use(express.json())
app.use(cors())

app.use("/api", router)

const start = async () => {

    await db.authenticate()
    await db.sync()

    // Product.create({
    //     descr:"test2",
    //     image_url:"test2",
    //     is_active:true,
    //     name:"test2",
    //     price:3000,
    //     sub_category_id:3
    // })
    // Category.create({
    //     name:"пк"
    // })
    // Category.create({
    //     name:"ноутбуки"
    // })
    // Category.create({
    //     name:"телефоны"
    // })

    // SubCategory.create({
    //     category_id:1,
    //     name:"сборки",
    // })
    // SubCategory.create({
    //     category_id:1,
    //     name:"игровые"
    // })
    // SubCategory.create({
    //     category_id:1,
    //     name:"офисные"
    // })

    await app.listen(PORT, () => {
        console.log(`Server has been started on port http://localhost:${PORT}`);
    })
}

start()