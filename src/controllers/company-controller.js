const { Company } = require("../models/models")
const getFullInclude = require("../utils/getFullInclude")

class CompanyController {

    async getCompanyById(req, res) {

        const { id } = req.params
        const { extend } = req.query

        try {
            const include = getFullInclude(extend)

            const companies = await Company.findOne({
                where: {
                    Company_id: id
                },
                include
            })

            return res.json({
                message: "Компания была успешно получена", data: companies
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async getCompanies(req, res) {

        const { extend } = req.query

        try {
            const include = getFullInclude(extend)
            const where = data?.filter ?? {}

            const companies = await Company.findAll({
                where,
                include
            })

            return res.json({
                message: "Компании успешно получены", data: companies
            })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async createCompany(req, res) {

        const data = req.body

        try {

            const newCompany = await Company.create({
                ...data
            })

            return res.json({ message: "Новая компания была успешно добавлена", data: newCompany })

        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

    async updateCompany(req, res) {

        const {
            ...data
        } = req.body

        const { id } = req.params

        try {

            const updatedCompany = await Company.update({
                ...data
            }, {
                where: {
                    company_id: id
                },
                returning: true
            })
            return res.json({ message: "Компания была успешно обновлена", data: updatedCompany[1][0].dataValues })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }

    }

    async deleteCompany(req, res) {
        const { id } = req.params

        try {

            const deletedCompany = await Company.destroy({
                where: {
                    company_id: id
                },
            })
            return res.json({ message: "Компания была успешно удалена", data: deletedCompany })
        } catch (error) {
            return res.status(400).json({ message: "Что то пошло не так" })
        }
    }

}

module.exports = new CompanyController()