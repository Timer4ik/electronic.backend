const { Slider, Enums } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude");
const getOffset = require("../utils/getOffset");
const loadFile = require("../utils/loadFile")

class SliderController {
    async getSliders(req, res) {

        const { slider_id, product_id, extend, page = 0, limit = 20,...data } = req.query
        const offset = getOffset(page, limit)

        try {
            const include = getFullInclude(extend)
            const where = data?.filter ?? {}

            const sliders = await Slider.findAll({
                where,
                include,
                limit,
                offset
            })

            return res.json({
                message: "Слайдеры успешно получены", data: sliders
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async createSlider(req, res) {

        const file = loadFile(req)

        const data = req.body

        try {
            const newSlider = await Slider.create({
                ...data,
                photo_url: data.photo
            })

            file?.load()
            return res.json({ message: "Новый слайдер был успешно добавлен", data: newSlider })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async updateSlider(req, res) {

        const file = loadFile(req)

        const {
            title,
            text,
            product_id,
            ...data
        } = req.body

        const { id } = req.params

        try {

            const updatedSlider = await Slider.update({
                title,
                text,
                product_id,
                photo_url: data.photo
            }, {
                where: {
                    slider_id: id
                },
                returning: true
            })

            file?.load()
            return res.json({ message: "Слайдер был успешно обновлён", data: updatedSlider[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

}

module.exports = new SliderController()