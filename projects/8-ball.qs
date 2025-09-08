namespace Main {
    import Std.Diagnostics.*;
    import Std.Math.*;

    @EntryPoint()
    operation EightBall() : Unit {
        use qs = Qubit[3];

        Message("Initial state: ");
        DumpMachine();

        H(qs[0]);
        H(qs[1]);
        H(qs[2]);
        
        Message("Superposition state: ");
        DumpMachine();

        let m1 = M(qs[0]);
        let m2 = M(qs[1]);
        let m3 = M(qs[2]);

        DumpMachine();

        if((m1, m2, m3) == (Zero, Zero, Zero)) {
            Message("Yes");
        } elif((m1, m2, m3) == (Zero, Zero, One)) {
            Message("Not today");
        } elif((m1, m2, m3) == (Zero, One, Zero)) {
            Message("Definitely");
        } elif((m1, m2, m3) == (Zero, One, One)) {
            Message("Try again");
        } elif((m1, m2, m3) == (One, Zero, Zero)) {
            Message("Signs points to yes");
        } elif((m1, m2, m3) == (One, Zero, One)) {
            Message("Not likely");
        } elif((m1, m2, m3) == (One, One, Zero)) {
            Message("Sure thing");
        } elif((m1, m2, m3) == (One, One, One)) {
            Message("Outlook not so good");
        }

        Reset(qs[0]);
        Reset(qs[1]);
        Reset(qs[2]);
    }
}