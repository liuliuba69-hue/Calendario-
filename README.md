# Numerologia Vedica

App iOS in SwiftUI che calcola il valore numerologico di un nome o di una parola secondo il sistema caldeo/vedico.

## Funzionamento

- Ogni lettera ha un valore da 1 a 8 (il 9 non viene assegnato a nessuna lettera nel sistema caldeo).
- Gli accenti vengono ignorati (`È` → `E`); spazi, numeri e simboli non vengono conteggiati.
- **Somma grezza**: la somma dei valori di tutte le lettere.
- **Numero ridotto**: la somma ridotta a una sola cifra (1–9) sommando ripetutamente le cifre.

| Valore | Lettere        |
|-------:|----------------|
| 1      | A I J Q Y      |
| 2      | B K R          |
| 3      | C G L S        |
| 4      | D M T          |
| 5      | E H N X        |
| 6      | U V W          |
| 7      | O Z            |
| 8      | F P            |

Esempio: `MARCO` = 4 + 1 + 2 + 3 + 7 = **17** → 1 + 7 = **8**.

## Come eseguirla

1. In Xcode (15 o successivo): **File → New → Project → iOS → App**, interfaccia SwiftUI, nome `NumerologiaVedica`.
2. Sostituisci i file `ContentView.swift` e `NumerologiaVedicaApp.swift` generati con quelli nella cartella `NumerologiaVedica/`.
3. Avvia su simulatore o dispositivo (iOS 16+).
