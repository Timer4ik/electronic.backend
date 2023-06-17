const loadFile = require("../utils/loadFile")
const { ProductPhoto, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")


class ProductPhotoController {
    async getProductPhotos(req, res) {

        const { extend, ...query } = req.query

        try {
            const include = getFullInclude(extend)
            const where = query?.filter ?? {}

            const photos = await ProductPhoto.findAll({
                where,
                include
            })

            return res.json({
                message: "Фотографии успешно получены", data: photos
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }
    async getProductPhotosByProjectId(req, res) {

        const { id } = req.params
        const { extend, ...query } = req.query

        try {
            const include = getFullInclude(extend)
            const where = query?.filter ?? {}

            where.product_id = id

            const photos = await ProductPhoto.findAll({
                where,
                include
            })

            return res.json({
                message: "Фотографии успешно получены", data: photos
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async loadPhoto(req, res) {

        // const file = loadFile(req, { multiple: true })

        const { id } = req.params
        const { files } = req.body

        try {
            if (!product_id) {
                throw new Error("Ошибка")
            }

            let productPhotos = await ProductPhoto.bulkCreate(files.map((file) => ({
                file_id:file,
                product_id: id
            })))

            // file?.load()

            return res.json({
                message: "Фотографии были успешно добавлены",
                data: productPhotos
            })


        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

}

module.exports = new ProductPhotoController()