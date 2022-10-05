//
//  main.swift
//  Actividad_1_Conceptos_Swift
//
//  Created by Jkutkut - Jorge Re invitado on 5/10/22.
//  Corrected by: --

import Foundation

// ************* TOOLS *************
func askDouble(question: String) -> Double {
    var input: String?
    while (true) {
        print(question, terminator: "")
        input = readLine()
        if let nbr = Double(input ?? "") {
            return nbr
        }
        print("El valor introducido no es un double válido")
    }
}

func askDoubleInRange(question: String, min: Double, max: Double) -> Double {
    var input: Double
    while true {
        input = askDouble(question: question)
        if (input >= min && input <= max) {
            return input
        }
        print(String(format: "El valor tiene que estar en el rango [%.5f, %.5f]", min, max))
    }
}

func askInt(question: String) -> Int {
    var input: String?
    while (true) {
        print(question, terminator: "")
        input = readLine()
        if let nbr = Int(input ?? "") {
            return nbr
        }
        print("El valor introducido no es un entero válido")
    }
}

func askIntInRange(question: String, min: Int, max: Int) -> Int {
    var input: Int
    while true {
        input = askInt(question: question)
        if (input >= min && input <= max) {
            return input
        }
        print(String(format: "El valor tiene que estar en el rango [%i, %i]", min, max))
    }
}

func askInRange(question: String, options: [String]) -> String {
    var input: String?
    while true {
        print(question, terminator: "")
        input = readLine()
        if (input != nil && options.contains(input!)) {
                return input!
        }
        print("Opción no encontrada. Opciones:", options)
    }
}


// ************* CODE *************

let DOUBLE_INFINITY: Double = Double.infinity
let INT_INFINITY: Int = Int.max

func ej1() {
    print("Dame los datos de un rectángulo. Te daré su perímetro y su área")
    let base = askDoubleInRange(question: "  Base: ", min: 0, max: DOUBLE_INFINITY)
    let altura = askDoubleInRange(question: "  Altura: ", min: 0, max: DOUBLE_INFINITY)
    print(String(format:
        "\nEl área es %.3f y el perímetro es %.3f.\n",
        base * altura,
        2 * (base + altura)
    ))
}

func ej2() {
    print("Dame los datos de un triángulo. Te daré su hipotenusa.")
    let c1 = askDoubleInRange(question: "  Cateto 1: ", min: 0, max: DOUBLE_INFINITY)
    let c2 = askDoubleInRange(question: "  Cateto 2: ", min: 0, max: DOUBLE_INFINITY)
    
    let hipotenusa = sqrt(c1 * c1 + c2 * c2)
    print(String(format:
        "\nLa hipotenusa del triángulo rectángulo es %.3f.\n",
        hipotenusa
    ))
}

func ej3() {
    print("Introduce los valores")
    let n1 = askDouble(question: "  n1: ")
    let n2 = askDouble(question: "  n2: ")

    print(String(format:"Suma          : %.3f + %.3f = %.3f", n1, n2, n1 + n2))
    print(String(format:"Resta         : %.3f - %.3f = %.3f", n1, n2, n1 - n2))
    print(String(format:"División      : %.3f * %.3f = %.3f", n1, n2, n1 / n2))
    print(String(format:"Multiplicación: %.3f / %.3f = %.3f", n1, n2, n1 * n2))
}

func ej4() {
    print("Conversor grados:")
    let f = askDouble(question: "Temperatura (F): ")
    let c = (f - 32) * 5 / 9

    print(String(format: "%.3f grados Farenheit son %.3f grados Celsius", f, c))
}

func ej5() {
    print("Calculador de medias")
    let n = askIntInRange(question: "Cantidad de números: ", min: 0, max: INT_INFINITY)
    var sum: Double = 0
    for i in 1...n {
        sum += askDouble(question: String(format: "%iº número: ", i))
    }
    let avg = sum / Double(n)
    print(String(format: "La media de los números es %.3f", avg))
}

func ej6() {
    print("Cálculo de salario:")
    let base = askDoubleInRange(question: "Salario base: ", min: 0, max: DOUBLE_INFINITY)
    let n = askIntInRange(question: "Cantidad comisiones: ", min: 0, max: INT_INFINITY)
    var commissions: Double = 0
    if n >= 1 {
        for i in 1...n {
            commissions += askDoubleInRange(question: String(format: "  Venta %i: ", i), min: 0, max: DOUBLE_INFINITY) * 0.1
        }
    }
    print(String(format: "Commisiones (%i): %.2f", n, commissions))
    print(String(format: "Salario total: %.2f + %.2f = %.2f", base, commissions, base + commissions))
}

func ej7() {
    print("Calculador nota IOS:")
    var parciales: Double = 0
    for i in 1...3 {
        parciales += askDoubleInRange(question: String(format: "Nota %iº parcial: ", i), min: 0, max: 10) / 3
    }
    let ex_final = askDoubleInRange(question: "Nota exámen final: ", min: 0, max: 10)
    let trabajo = askDoubleInRange(question: "Nota trabajo final: ", min: 0, max: 10)
    print("La nota final es:")
    print(String(format:
        ".55 * %.2f + .3 * %.2f + .15 * %.2f = %.2f",
         parciales,
         ex_final,
         trabajo,
         0.55 * parciales + 0.3 * ex_final + 0.15 * trabajo
    ))
}

func ej8() {
    let CORRECT = 5
    let INCORRECT = -1
    let BLANK = 0

    print("Calculador nota exámen:")
    let n = askIntInRange(question: "Número preguntas: ", min: 1, max: INT_INFINITY)
    print("Introduce si el ejercicio es Correcto, Incorrecto o Blanco")
    var nota: Int = 0
    for i in 1...n {
        switch (askInRange(question: String(format: "Nota ej%i: ", i), options: ["c", "i", "b"])) {
            case "c":
                nota += CORRECT
            case "i":
                nota += INCORRECT
            default: // case "b":
                nota += BLANK
        }
    }
    print(String(format: "\nNota: %i/%i", nota, n * CORRECT))
}

func ej9() {
    print("Cálculo sueldo trabajador por horas:")
    let base = askDoubleInRange(question: "Salario base (hora): ", min: 10, max: DOUBLE_INFINITY)
    let extra = askDoubleInRange(question: "Salario hora extra: ", min: 10, max: DOUBLE_INFINITY)
    let base_h = askIntInRange(question: "Horas base trabajadas: ", min: 4, max: 40)
    let extra_h = askIntInRange(question: "Horas extra trabajadas: ", min: 0, max: 30)
    
    print(String(format: "Total: %i * %.2f + %i * %.2f = %.2f",
        base_h,
        base,
        extra_h,
        extra,
        Double(base_h) * base + Double(extra_h) * extra
    ))
}

// ************* LOOP *************

let EJERCICIOS = [ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9]
var ej: Int;
print("Hola! Vamos a ejecutar varios scripts:")
while true {
    print("Introduce el ejercicio que quieres revisar (0 para salir):")
    ej = askIntInRange(question: "$> ", min: 0, max: EJERCICIOS.count)
    if ej == 0 {
        break
    }
    print()
    EJERCICIOS[ej - 1]()
    print("\n\n")
}

print("Gracias por su verificación")
