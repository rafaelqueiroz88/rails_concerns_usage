p 'Starting Seed process'
Car.create([
  {
    name: 'Gol',
    model: 'G1',
    color: 'White',
    document: '123456789'
  },
  {
    name: 'Gol',
    model: 'G2',
    color: 'Red',
    document: '123456710'
  },
  {
    name: 'Gol',
    model: 'G3',
    color: 'Blue',
    document: '123456711'
  },
  {
    name: 'Gol',
    model: 'G4',
    color: 'White',
    document: '123456712'
  },
])

Pilot.create({ name: 'Rafael', document: '123456-123'})
p 'Seed process has finished'