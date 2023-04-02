const { Category } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")

class CategoryController {

    async getCategoryById(req, res) {

        const { id } = req.params
        const { extend } = req.query

        try {
            const include = getFullInclude(extend)

            const categories = await Category.findOne({
                where: {
                    category_id:id
                },
                include
            })

            return res.json({
                message: "Категория была успешно получена", data: categories
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async getCategories(req, res) {

        const { category_id, extend } = req.query

        try {
            const include = getFullInclude(extend)
            const where = data?.filter ?? {}

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

    async createCategory(req, res) {

        const data = req.body

        try {

            const newCategory = await Category.create({
                ...data
            })

            return res.json({ message: "Новая категория была успешно добавлена", data: newCategory })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async updateCategory(req, res) {

        const {
            ...data
        } = req.body

        const { id } = req.params

        try {

            const updatedCategory = await Category.update({
                ...data
            }, {
                where: {
                    category: id
                },
                returning: true
            })
            return res.json({ message: "Категория была успешно обновлена", data: updatedCategory[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

}

module.exports = new CategoryController()