class Population {

  float mutationRate;
  Design[] population;
  ArrayList<Design> matingPool; 
  int generations;

  Population(float m, int num) {
    mutationRate = m;
    population = new Design[num];
    matingPool = new ArrayList<Design>();
    generations = 0;
    for (int i = 0; i < population.length; i++) {
      population[i] = new Design(new DNA(), 70+(i%(population.length/2))*220, 100 + ceil(i/(population.length/2))*240);
    }
  }

  void display() {
    for (int i = 0; i < population.length; i++) {
      population[i].display();
    }
  }

  void rollover(int mx, int my) {
    for (int i = 0; i < population.length; i++) {
      population[i].rollover(mx, my);
    }
  }

  void selection() {
    matingPool.clear();

    float maxFitness = getMaxFitness();

    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }  

  void reproduction() {
    for (int i = 0; i < population.length; i++) {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));

      Design mom = matingPool.get(m);
      Design dad = matingPool.get(d);

      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();

      DNA child = momgenes.crossover(dadgenes);

      child.mutate(mutationRate);

      population[i] = new Design(child, 70+(i%(population.length/2))*220, 100 + ceil(i/(population.length/2))*240);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].getFitness() > record) {
        record = population[i].getFitness();
      }
    }
    return record;
  }
}
