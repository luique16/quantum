namespace Main {
    import Std.Diagnostics.*;
    import Std.Math.*;

    @EntryPoint()
    operation RotateQubit() : Result {
        use q = Qubit();

        Message("State 0:");
        DumpMachine();

        H(q);

        Message("State 1:");
        DumpMachine();

        // P(|0>) = 75%, P(|1>) = 25%
        // cos²(θ/2) = 3/4 => cos(θ/2) = sqrt(3)/4
        // θ/2 = π/6 => θ = π/3  (distance between |0> and qubit)
        // q = |+> => Δθ = (π/2 - π/3) => Δθ = π/6
        Ry(-PI()/6., q);

        Message("State 2:");
        DumpMachine();

        let s = M(q);

        Reset(q);

        return s;
    }
}