const { PropertyType } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")

class PropertyTypeController {
    async getPropertyTypeById(req, res) {

        const { id } = req.params
        const { extend } = req.query

        try {
            const include = getFullInclude(extend)

            const propertyType = await PropertyType.findOne({
                where: {
                    property_type_id: id
                },
                include
            })

            return res.json({
                message: "Тип характеристики был успешно получен", data: propertyType
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async getPropertyTypes(req, res) {

        const { extend, ...query } = req.query

        try {
            const include = getFullInclude(extend)
            const where = query?.filter ?? {}

            const propertyTypes = await PropertyType.findAll({
                where,
                include
            })

            return res.json({
                message: "Типы характеристик были успешно получены", data: propertyTypes
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async createPropertyType(req, res) {

        const data = req.body

        try {
                               
            console.log(data);

            const newPropertyType = await PropertyType.create({
                ...data
            })

            return res.json({ message: "Новый тип характеристики был успешно добавлен", data: newPropertyType })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async updatePropertyType(req, res) {

        const {
            ...data
        } = req.body

        const { id } = req.params

        try {

            const propertyType = await PropertyType.update({
                ...data
            }, {
                where: {
                    property_type_id: id
                },
                returning: true
            })
            return res.json({ message: "Тип характеристики был успешно обновлен", data: propertyType[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async deletePropertyType(req, res) {

        const { id } = req.params

        try {

            const deletedPropertyType = await PropertyType.destroy({
                where: {
                    property_type_id: id
                },
            })
            return res.json({ message: "Тип характеристики был успешно удален", data: deletedPropertyType })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }
}

module.exports = new PropertyTypeController()