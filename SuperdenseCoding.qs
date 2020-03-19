namespace SuperdenseCoding {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;

    operation encode(alicQbit: Qubit, bobQbit: Qubit, bit1 : Int, bit2: Int) : Unit {
        // ...
        Message("Preparing the Bell State");
        H(alicQbit);
        CNOT(alicQbit, bobQbit);
        
        Message("Sending One Qubit to Alice and One to Bob");

        if (bit2 == 1){
            X(alicQbit);
        }
        if (bit1 == 1){
            Z(alicQbit);
        }

        Message("Alice Finished Encoding ("+ IntAsString(bit1) + ", " + IntAsString(bit2) +  "). Sending to Bob to decode.");
    }

    operation decode(alice: Qubit, bob: Qubit) : (Int, Int) {
        // ...
        CNOT(alice, bob);
        H(alice);
        mutable bit1 = 0;
        mutable bit2 = 0;
        if (M(alice) == One){
            set bit1 = 1;
        }
        
        if (M(bob) == One){
            set bit2 = 1;
        }
        Reset(alice);
        Reset(bob);
        
        Message("Finished Decoding, result is (" + IntAsString(bit1) + ", " + IntAsString(bit2) + ")");
        return (bit1, bit2);
    }

    operation superDenseSendTest(bit1: Int, bit2 : Int) : (Int, Int) {
        
        using ((alice, bob) = (Qubit(), Qubit())) {
            encode(alice, bob, bit1, bit2);
            let (r1, r2) = decode(alice, bob);
            return (r1, r2);

        }

    }

}
