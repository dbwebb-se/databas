#!/usr/bin/env node

"use strict"

const fs = require("fs").promises
const path = "./result.data"

// Manage printed columnnames
const formatting = ["Kmom01", "Kmom02", "Kmom03", "Kmom04", "Kmom05", "Kmom06", "Total", "%", "G", "%G"]

function doMagic(data) {
    let result = {}
    let total = {}
    let lines = data.split("\n")

    total.Total = {}
    total["Genomströmning"] = {}
    total.Total["G"] = 0
    total.Total.Total = 0

    for (const line of lines) {
        let parts = line.split(",")

        if (parts.length !== 3) continue

        let kmom = parts[0].replace(/^"|"$/g, '')
        let teacher = parts[1].replace(/^"|"$/g, '')
        let grade = parts[2].replace(/^"|"$/g, '')

        total.Total.Total ++

        if (!(teacher in result)) result[teacher] = {}

        // For Teacher
        kmom in result[teacher] ? result[teacher][kmom]++ : result[teacher][kmom] = 1
        grade in result[teacher] ? result[teacher][grade]++ : result[teacher][grade] = 1
        "Total" in result[teacher] ? result[teacher].Total++ : result[teacher].Total = 1

        // For Extra
        kmom in total.Total ? total.Total[kmom]++ : total.Total[kmom] = 1
        kmom in total.Total ? total.Total[kmom]++ : total.Total[kmom] = 1
        kmom in total["Genomströmning"] ? total["Genomströmning"][kmom] = Math.round((total.Total[kmom] / total.Total["Kmom01"])*100) + "%" : total["Genomströmning"][kmom] = 0
    }

    for (let item in result) {
        result[item]["%"] = Math.round((result[item].Total / total.Total.Total)*100) + "%"
        result[item]["%G"] = Math.round((result[item]["G"] / result[item].Total)*100) + "%"
        total.Total["G"] += result[item]["G"]
        total.Total["%G"] = Math.round((total.Total["G"] / total.Total.Total)*100) + "%"
    }

    total.Total["%"] = "100%"

    result["----------"] = {}
    result["Total"] = total.Total
    result["Genomströmning"] = total["Genomströmning"]

    return result
}

async function main () {
    let data = await fs.readFile(path, "utf8");
    let result = doMagic(data)

    console.table(result, formatting)
}

main()
