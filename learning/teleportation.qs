namespace Main {
    import Std.Diagnostics.*;
    import Std.Math.*;

    operation Teleport(q: Qubit, t: Qubit) : Unit {
        use r = Qubit();

        H(r);

        CNOT(r, t);
        CNOT(q, r);
        
        H(q);

        CX(r, t);
        CZ(q, t);

        Reset(r);
        Reset(q);
    }

    @EntryPoint()
    operation Teleportation() : Unit {
        use (q, t) = (Qubit(), Qubit());

        // |-i> => 75% |0> and 25% |1>
        H(q);
        Rz(-PI(), q);
        Ry(PI()/6., q);

        Message("State 0:");
        DumpRegister([q]);


        Teleport(q, t);

        Message("State 1:");
        DumpRegister([t]);

        Reset(t);
    }
}