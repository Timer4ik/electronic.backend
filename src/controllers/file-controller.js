const loadFile = require("../utils/loadFile")
const { File, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")


class FileController {
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

        const file = loadFile(req)

        const data = req.body
        file?.load()
        try {

            let files = await File.create({
                name: data.file,
                link: process.env.API_URL + data.file,
                size: file.size
            })

            file?.load()

            return res.json({
                message: "Фотографии были успешно добавлены",
                data: files
            })


        } catch (error) {
            console.log(error);
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

}

module.exports = new FileController()