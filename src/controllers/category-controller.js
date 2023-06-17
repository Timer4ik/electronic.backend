const { Op } = require("sequelize")
const { Category, File } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")
const loadFile = require("../utils/loadFile")

class CategoryController {

    async getCategoryById(req, res) {

        const { id } = req.params
        const { extend } = req.query

        try {
            const include = getFullInclude(extend)

            const { dataValues: category } = await Category.findOne({
                where: {
                    category_id: id
                },
                include,

            })
            category.parent = await Category.findOne({
                where: {
                    category_id: category.parent_id
                },
            })
            return res.json({
                message: "Категория была успешно получена", data: category
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async getCategories(req, res) {

        const { category_id, extend, extendParent, page, limit, like } = req.query

        const query = req.query

        try {
            const include = extend ? getFullInclude(extend) : null
            const where = query?.filter ?? {}

            if (like?.length) {
                where.name = {
                    [Op.like]: `%${like}%`
                }
            }

            const categories = await Category.findAll({
                where,
                limit: limit || 10,
                offset: (limit * page) || 0,
                order: [['category_id', 'ASC']],
                include,
            })

            let cats = [...categories.map(item => item.dataValues)]

            if (extendParent) {
                for (let item of cats) {
                    item.parent = await Category.findOne({
                        where: {
                            category_id: item.parent_id
                        },
                    })
                }
            }
            const count = await Category.count()

            return res.json({
                message: "Категории успешно получены", data: cats, page, count
            })

        } catch (error) {
            console.log(error);
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async createCategory(req, res) {


        const file = loadFile(req)

        const { ...data } = req.body


        try {

            const newCategory = await Category.create({
                ...data,
            })

            file?.load()

            return res.json({ message: "Новая категория была успешно добавлена", data: newCategory })

        } catch (error) {

            return res.status(400).json({ message: "Что то пошло не так", error })
        }
    }

    async updateCategory(req, res) {

        const {
            ...data
        } = req.body

        const { id } = req.params

        try {

            const updatedCategory = await Category.update({
                ...data,
            }, {
                where: {
                    category_id: id
                },
                returning: true
            })

            return res.json({ message: "Категория была успешно обновлена", data: updatedCategory[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

    async deleteCategoryById(req, res) {

        const { id } = req.params

        try {

            await Category.destroy({
                where: {
                    category_id: id
                }
            })

            return res.json({ message: "Категория была успешно удалена" })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

}

module.exports = new CategoryController()