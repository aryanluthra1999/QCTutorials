namespace QTeleportation {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // ...
    operation TeleportationTester(toClone : Qubit) : Bool {
        using ((alice, bob) = (Qubit(), Qubit())) {
            // ...
            // Create a shared bell state
            H(alice);
            CNOT(alice, bob);
        
            Message("Sending one qubit from bell state to BOB");

            Teleporter(toClone, alice, bob);

            
        
        }
    }

    operation Teleporter(toClone : Qubit, alice : Qubit, bob: Qubit) : Unit{
        CNOT(toClone, alice);
        H(toClone);
        let controlZ = M(toClone);
        let controlX = M(alice);

        Message("Entanglement Complete. Sending Bits");

        if (controlX == One){
            X(bob);
        }

        if (controlZ == One){
            Z(bob);
        }

    }

}
