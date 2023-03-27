const productController = require("../controllers/product-controller")
const authMiddleware = require("../middlewares/auth-middleware")
const protectedMiddleware = require("../middlewares/protected-middleware")

const Router = require("express").Router

const router = Router()

router.post("/product"/*, protectedMiddleware*/, productController.createProduct)
// router.put("/film/:id", protectedMiddleware, filmController.updateFilm)
router.get("/products", productController.getProducts)
router.get("/products/:id", productController.getProductById)

module.exports = router