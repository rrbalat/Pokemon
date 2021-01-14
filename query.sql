-- Ispisi sve korisnike i njihove pokemone, sortiraj po imenu korisnika
select User.Name, Pokemon.Name
from UserPokemon
inner join User
on User.Id = UserPokemon.UserId
inner join Pokemon
on Pokemon.Id = UserPokemon.PokemonId
order by User.Name;

-- Ispisi sve pokemone koji su Flying tipa i imaju evoluciju
select Pokemon.Name, Type.Name, Pokemon.EvolutionPokemonId
from PokemonType
inner join Pokemon
on Pokemon.Id = PokemonType.PokemonId
inner join Type
on Type.Id = PokemonType.TypeId
where Type.Abrv = "flying" and Pokemon.EvolutionPokemonId is not null;

-- Ispisi sve pokomone koji su uhvaceni na xyz lokaciji i tezi su od x kg i sortiraj ih po tezini
select Pokemon.Name, Location.Name, UserPokemon.Width
from UserPokemon
inner join Pokemon
on Pokemon.Id = UserPokemon.PokemonId
inner join Location
on Location.Id = UserPokemon.LocationId
where Location.Id = 'c76daf1e-55a4-11eb-a450-40a8f06885bd' and UserPokemon.Width > 0.5
order by UserPokemon.Width;


-- Ispisi sve generacije i broj pokemona u svakoj
select Generation.Name, count(*)
from Pokemon
inner join Generation
on Pokemon.GenerationId = Generation.Id
group by Generation.Name;

-- grupiraj težine uhvačenih pokemona po useru, grupirano po useru i pokemonu
select User.Name, Pokemon.Name, sum(UserPokemon.Width)
from UserPokemon
inner join User
on User.Id = UserPokemon.UserId
inner join Pokemon
on Pokemon.Id = UserPokemon.PokemonId
group by User.Name, Pokemon.Name;

-- Ispisi duple pokemone po korisniku
select Pokemon.Name, count(*)
from UserPokemon
inner join Pokemon
on Pokemon.Id = UserPokemon.PokemonId
group by Pokemon.Id
having count(*) = 2;