const { Product, SubCategory, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")
const getOffset = require("../utils/getOffset")

class ProductController {

    async getProducts(req, res) {

        const { page = 0, limit = 20 } = req.query

        const offset = getOffset(page, limit)

        const { product_id, sub_category_id, category_id, extend } = req.query

        const include = getFullInclude(extend)
        const where = {}

        if (product_id) {
            where.product_id = product_id
        }
        if (sub_category_id) {
            where.sub_category_id = sub_category_id
        }
        if (category_id) {
            include.push({
                model: SubCategory,
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

        const include = []
        const where = {}

        const { product_id, sub_category_id, category_id, extend } = req.query
        const { id } = req.params

        where.product_id = id

        if (product_id) {
            where.product_id = product_id
        }
        if (sub_category_id) {
            where.sub_category_id = sub_category_id
        }
        if (category_id) {
            include.push({
                model: SubCategory,
                where: {
                    category_id
                }
            })
        }
        if (extend) {
            include.push(...extend.split(",").map(ex => ({
                model: Enums[ex],
            })))
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


    // async createFilm(req, res) {
    //     const {
    //         name,
    //         year,
    //         descr,
    //         status,
    //         price,
    //         image_url,
    //         rent_start_dt,
    //         rent_end_dt,
    //         session_times,
    //     } = req.body

    //     try {

    //         const newFilm = await Film.create({
    //             name,
    //             year,
    //             descr,
    //             status,
    //             price,
    //             image_url,
    //             rent_start_dt,
    //             rent_end_dt,
    //             session_times,
    //         })

    //         return res.json({ message: "Фильм был успешно добавлен", data: newFilm })
    //     } catch (error) {
    //         console.log(error);
    //         return res.status(400).json({ message: "Что то пошло не так" })
    //     }
    // }

    // async updateFilm(req, res) {
    //     const {
    //         name,
    //         year,
    //         descr,
    //         status,
    //         price,
    //         image_url,
    //         rent_start_dt,
    //         rent_end_dt,
    //         session_times,
    //     } = req.body

    //     const { id } = req.params

    //     try {

    //         const udpatedFilm = await Film.update({
    //             name,
    //             year,
    //             descr,
    //             status,
    //             price,
    //             image_url,
    //             rent_start_dt,
    //             rent_end_dt,
    //             session_times,
    //         }, {
    //             where: {
    //                 rent_film_id: id
    //             },
    //             returning: true
    //         })

    //         return res.json({ message: "Фильм был успешно обновлён", data: udpatedFilm[1][0].dataValues })
    //     } catch (error) {
    //         return res.status(400).json({ message: "Что то пошло не так" })
    //     }
    // }
}

module.exports = new ProductController()