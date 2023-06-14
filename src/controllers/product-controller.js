const { Product, Category, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")
const getOffset = require("../utils/getOffset")
const loadFile = require("../utils/loadFile")

class ProductController {

    async getProducts(req, res) {

        const { page = 0, limit = 20 } = req.query

        const offset = getOffset(page, limit)

        const { product_id, category_id, extend, ...query } = req.query

        const include = getFullInclude(extend)
        const where = query?.filter ?? {}

        if (product_id) {
            where.product_id = product_id
        }
        // if (sub_category_id) {
        //     where.sub_category_id = sub_category_id
        // }
        if (category_id) {
            include.push({
                model: Category,
                where: {
                    category_id
                }
            })
        }
        try {
            const product = await Product.findAll({
                where,
                include: include,
                limit,
                offset
            })

            return res.json({ message: "Продукты успешно получены", data: product })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }
    async getProductById(req, res) {

        const { product_id, category_id, extend } = req.query
        const { id } = req.params

        const include = getFullInclude(extend)
        const where = data?.filter ?? {}

        where.product_id = id

        if (product_id) {
            where.product_id = product_id
        }
        // if (sub_category_id) {
        //     where.sub_category_id = sub_category_id
        // }
        if (category_id) {
            include.push({
                model: Category,
                where: {
                    category_id
                }
            })
        }

        try {
            const product = await Product.findOne({
                where,
                include,
            })

            return res.json({ message: "Продукт получен", data: product })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

    async createProduct(req, res) {

        const file = loadFile(req)

        const data = req.body

        try {
            const newProduct = await Product.create({
                ...data,
                image_url: data?.photo
            })

            file?.load()
            return res.json({ message: "Новый продукт был успешно добавлен", data: newProduct })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так",error })
        }
    }

    async updateProduct(req, res) {

        const file = loadFile(req)

        const {
            name,
            year,
            descr,
            status,
            price,
            rent_start_dt,
            rent_end_dt,
            session_times,
            ...data
        } = req.body

        const { id } = req.params

        try {

            const udpatedFilm = await Film.update({
                name,
                year,
                descr,
                status,
                price,
                image_url,
                rent_start_dt,
                rent_end_dt,
                session_times,
                image_url: data.photo
            }, {
                where: {
                    rent_film_id: id
                },
                returning: true
            })
            file?.load()
            return res.json({ message: "Фильм был успешно обновлён", data: udpatedFilm[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }
}

module.exports = new ProductController()