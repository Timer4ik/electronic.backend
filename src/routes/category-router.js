const CategoryController = require("../controllers/category-controller")

const Router = require("express").Router

const router = Router()

router.get("/categories", CategoryController.getCategories)
router.get("/categories/:id", CategoryController.getCategoryById)
router.post("/categories", CategoryController.createCategory)
router.put("/categories/:id", CategoryController.updateCategory)
router.delete("/categories/:id", CategoryController.deleteCategoryById)

module.exports = router