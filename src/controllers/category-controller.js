const { Category, SubCategory, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")

class CategoryController {
    async getCategories(req, res) {

        const { category_id, extend } = req.query

        try {
            const include = getFullInclude(extend)
            const where = {}

            if (category_id) {
                where.category_id = category_id
            }

            const categories = await Category.findAll({
                where,
                include
            })

            return res.json({
                message: "Категории успешно получены", data: categories
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

}

module.exports = new CategoryController()