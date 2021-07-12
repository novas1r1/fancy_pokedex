# Fancy Pokédex
## What is it?
This is a Pokédex app for Android & iOS & web (?) made while live-programming on [Twitch](https://twitch.tv/novas1r1). It uses Flutter/Dart.
It displays only the first generation of Pokémon :)!

### Tech Stack
- Flutter
- Dart
- BLoC as Statemanagement

### UI
Design was provided on [dribbble](https://dribbble.com/shots/14241781-Pok-dex/attachments/5886808?mode=media) made by Bruna Campos.

### API
There's no real API atm. It uses a modified local json file from [npentrel](https://gist.githubusercontent.com/npentrel/06c2ad3b38cf4e155244cfb67efb3a9b/raw/b2a5bffd317eda27d67373faacd9f0eac7d85e0b/pokemon.json). It's not using the official PokéAPI yet (was too complicated for the beginning and I was too lazy <.<) 

## TODOS
- Clean up all the TODOs in the code :)
- Migrate using an official API (Poké API)
- Cache all data received by whatever API is attached
- Search for a Pokémon in the overview
- Filter Pokémon by type
- Add a real Pokédex functionality with a camera and Image Recognition stuff. So if I'm moving the camera over a pokemon it should recognize which one it is, search for it in our attached API (or local data) and display that information

## How to contribte?
Just checkout the live-stream on Twitch or join us on [discord](https://discord.gg/UbfVbDemjr). 