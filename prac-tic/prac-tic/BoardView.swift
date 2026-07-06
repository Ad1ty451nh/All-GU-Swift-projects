import SwiftUI

enum WinningLine {
    case row0, row1, row2
    case col0, col1, col2
    case diagLeft, diagRight
}

struct BoardView: View {

    @State private var board: [Bool?] = Array(repeating: nil, count: 9)
    @State private var isXTurn = true
    @State private var winningLine: WinningLine?

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        VStack(spacing: 20) {

            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()

            ZStack {

                LazyVGrid(columns: columns, spacing: 12) {

                    ForEach(0..<9, id: \.self) { index in
                        BoardCellView(value: board[index]) {
                            handleTap(at: index)
                        }
                    }
                }

                if let line = winningLine {

                    Rectangle()
                        .fill(.red)
                        .frame(
                            width: isVertical(line) ? 6 : 360,
                            height: isVertical(line) ? 360 : 6
                        )
                        .rotationEffect(rotation(for: line))
                        .offset(offset(for: line))
                        .animation(.easeInOut(duration: 0.4), value: winningLine)
                }
            }
            .padding()

            Button("Reset") {
                board = Array(repeating: nil, count: 9)
                isXTurn = true
                winningLine = nil
            }
            .font(.headline)

        }
        .padding()
    }

    func handleTap(at index: Int) {

        guard winningLine == nil else { return }
        guard board[index] == nil else { return }

        board[index] = isXTurn

        checkWinner()

        isXTurn.toggle()
    }

    func checkWinner() {

        let wins: [([Int], WinningLine)] = [

            ([0,1,2], .row0),
            ([3,4,5], .row1),
            ([6,7,8], .row2),

            ([0,3,6], .col0),
            ([1,4,7], .col1),
            ([2,5,8], .col2),

            ([0,4,8], .diagLeft),
            ([2,4,6], .diagRight)
        ]

        for (cells, line) in wins {

            let a = cells[0]
            let b = cells[1]
            let c = cells[2]

            if board[a] != nil &&
                board[a] == board[b] &&
                board[b] == board[c] {

                winningLine = line
                return
            }
        }
    }

    func isVertical(_ line: WinningLine) -> Bool {

        switch line {
        case .col0, .col1, .col2:
            return true
        default:
            return false
        }
    }

    func rotation(for line: WinningLine) -> Angle {

        switch line {

        case .diagLeft:
            return .degrees(45)

        case .diagRight:
            return .degrees(-45)

        default:
            return .degrees(0)
        }
    }

    func offset(for line: WinningLine) -> CGSize {

        switch line {

        case .row0:
            return CGSize(width: 0, height: -100)

        case .row1:
            return .zero

        case .row2:
            return CGSize(width: 0, height: 100)

        case .col0:
            return CGSize(width: -100, height: 0)

        case .col1:
            return .zero

        case .col2:
            return CGSize(width: 100, height: 0)

        case .diagLeft:
            return .zero

        case .diagRight:
            return .zero
        }
    }
}

struct BoardCellView: View {

    let value: Bool?
    let onTap: () -> Void

    var body: some View {

        ZStack {

            Circle()
                .fill(.black)
                .frame(width: 90, height: 90)

            if let value = value {

                Image(systemName: value ? "x.circle" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    BoardView()
}
