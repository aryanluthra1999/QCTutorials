namespace QuantumRandomNumberGen {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // File used to generate Quantum Random Numbers
    operation randomBit() : Result {
        // generates one random bit
        using (target = Qubit()) {
            // ...
            H(target);
            let result = M(target);
            Reset(target);
            return result;
        }
    }
}