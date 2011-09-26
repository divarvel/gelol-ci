class Voiture {

    protected Moteur moteur;
    protected Personne conducteur;

    // MAL
    public Voiture() {
        moteur = new MoteurEssence();
        conducteur = new JeuneConducteur();
    }

    // BIEN
    public Voiture(Moteur m, Conducteur c) {
        moteur = m;
        conducteur = c;
    }
}
