import SwiftUI

struct ContentView: View {
    @State private var nomeInput: String = ""
    @State private var sommaGrezza: Int = 0
    @State private var numeroRidotto: Int = 0
    @State private var haCalcolato: Bool = false

    // Mappa Caldea / Vedica
    let mappaCaldea: [Character: Int] = [
        "A": 1, "I": 1, "J": 1, "Q": 1, "Y": 1,
        "B": 2, "K": 2, "R": 2,
        "C": 3, "G": 3, "L": 3, "S": 3,
        "D": 4, "M": 4, "T": 4,
        "E": 5, "H": 5, "N": 5, "X": 5,
        "U": 6, "V": 6, "W": 6,
        "O": 7, "Z": 7,
        "F": 8, "P": 8
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                // Descrizione
                Text("Inserisci un nome o una parola per calcolare il valore secondo la numerologia caldea/vedica.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Campo di input
                TextField("Es. Marco", text: $nomeInput)
                    .textFieldStyle(.roundedBorder)
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.characters)
                    .submitLabel(.done)
                    .onSubmit(calcolaNumerologia)
                    .padding(.horizontal)

                // Pulsante di calcolo
                Button(action: calcolaNumerologia) {
                    Text("Calcola")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                // Sezione Risultati
                if haCalcolato {
                    VStack(spacing: 12) {
                        Text("Risultato")
                            .font(.title2)
                            .bold()

                        HStack(spacing: 20) {
                            VStack {
                                Text("Somma Grezza")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(sommaGrezza)")
                                    .font(.title)
                                    .bold()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                            VStack {
                                Text("Numero Ridotto")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(numeroRidotto)")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.indigo)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                }

                Spacer()
            }
            .navigationTitle("Numerologia Vedica")
            .padding(.top)
        }
    }

    // Algoritmo di calcolo
    func calcolaNumerologia() {
        // Rimuove gli accenti (es. "È" -> "E") così i nomi italiani vengono conteggiati correttamente
        let testoPulito = nomeInput
            .folding(options: .diacriticInsensitive, locale: Locale(identifier: "it_IT"))
            .uppercased()
            .filter { $0.isLetter }

        var somma = 0
        for char in testoPulito {
            if let valore = mappaCaldea[char] {
                somma += valore
            }
        }

        guard somma > 0 else {
            withAnimation { haCalcolato = false }
            return
        }

        sommaGrezza = somma

        // Riduzione a singola cifra (da 1 a 9)
        var ridotto = somma
        while ridotto > 9 {
            ridotto = String(ridotto)
                .compactMap { $0.wholeNumberValue }
                .reduce(0, +)
        }

        numeroRidotto = ridotto
        withAnimation { haCalcolato = true }
    }
}

#Preview {
    ContentView()
}
