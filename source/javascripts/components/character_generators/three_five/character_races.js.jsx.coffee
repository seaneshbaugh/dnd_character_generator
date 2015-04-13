CharacterGeneratorThreeFiveCharacterRaces = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

   getInitialState: ->
    showUncommonRaces: false

  render: ->
    uncommonRacesContainerClass = "row uncommon-races"

    if @state.showUncommonRaces
      uncommonRacesToggleButtonText = "Hide Uncommon"
    else
      uncommonRacesContainerClass += " hidden"

      uncommonRacesToggleButtonText = "Show Uncommon"

    `<div className="col-xs-12 col-sm-9">
      <div className="form-inline common-races">
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Human" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dwarf" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Elf" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gnome" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Elf" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Orc" />
        <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Halfling" />
      </div>
      <button className="btn btn-default" onClick={this._onShowUncommonRaces}>{uncommonRacesToggleButtonText}</button>
      <div className={uncommonRacesContainerClass}>
        <div className="col-xs-12 col-sm-3">
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aarakocra" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aasimar" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Air Genasi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Air Mephling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Alaghi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Elf (FR)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Goblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Half-Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Half-Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Human" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Kobold" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aquatic Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Dwarf (FR)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Goblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Half-Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Half-Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Kobold" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Arctic Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Astral Deva" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Aurak Draconian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Azuran" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Baaz Draconian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bahamut's (Breath)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bahamut's (Mind)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bahamut's (Wings)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bamboo Spiritfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bariaur" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bladeback Saurial" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bozak Draconian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Bugbear" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Buomman" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Catfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Centaur" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Centaur (Krynn)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Changeling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Chaond" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Chaos Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dargonesti Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dark Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deep Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deep Dwarf (Krynn)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deep Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deep Halfling" />
        </div>
        <div className="col-xs-12 col-sm-3">
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deep Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deepwyrm Drow" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Deepwyrm Half-Drow" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Goblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Half-Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Half-Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Kobold" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desert Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Desmodu" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dimernesti Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Doppelganger" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dream Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dromite" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Duskling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Earth Genasi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Earth Mephling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Elan" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Feral Gargun" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Fey'ri" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Finhead Saurial" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Fire Genasi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Fire Mephling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Fireblood Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Flyer Saurial" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Forest Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Forestlord Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Forestlord Half-Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Frostblood Half-Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Frostblood Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gargoyle" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Githyanki" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Githzerai" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Glimmerskin Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gnoll" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Goblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gold Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Goliath" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gray Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gray Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gray Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Grippli" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Grimlock" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Gully Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half Aquatic Elf (FR)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Dragon" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half Drow" />
        </div>
        <div className="col-xs-12 col-sm-3">
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Giant" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Ogre (Sav. Sp.)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Half-Ogre (Krynn)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hengeyokai" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="High Ogre" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hobgoblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hornhead Saurial" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hound Archon" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hybsil" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Illumian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jann" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Goblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Half-Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Half-Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Kobold" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Jungle Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kagonesti Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kalashtar" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kapak Draconian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kender" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Killoren" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kobold" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Korobokuru" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Kuo-Toa" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Lizard Folk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Locathah" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Loxo" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Lupin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Maenad" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Merfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Mind Flayer" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Minotaur" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Minotaur (Krynn)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Modron Exile" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Mongrel Folk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Mul" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Neraph" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Ogre" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Ogre Mage" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Orc" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Pixie" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Pterran" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Qualinesti Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Rakshasa" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Raptoran" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Ratling" />
        </div>
        <div className="col-xs-12 col-sm-3">
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Rilkan" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="River Spiritfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sahuagin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Satyr" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sea Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sea Kin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sea Spiritfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Shadowswyft" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sharakim" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Shifter" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Silvanesti Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Silverbrow Human" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sivak Draconian" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Skarn" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Skulk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Spiker" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Stonechild" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Stonehunter Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Sunscorch Hobgoblin" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Synad" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Tallfellow Halfling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Tanarruk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Tasloi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Thri-Kreen" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Tiefling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Tinker Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Troglodyte" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Troll" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Underfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Urdunnir Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Vanara" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Viletooth Lizardfolk" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Warforged" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Water Genasi" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Water Mephling" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wemic" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Whisper Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wild Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wild Dwarf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wild Gnome" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wildren" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Winged Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Wood Elf" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Xeph" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="YuanTi Pureblood" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Zenythr" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hellbred (Body)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Hellbred (Spirit)" />
          <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Other" />
        </div>
      </div>
    </div>`

  _onShowUncommonRaces: (event) ->
    event.preventDefault()

    @setState
      showUncommonRaces: !@state.showUncommonRaces

window.CharacterGeneratorThreeFiveCharacterRaces = CharacterGeneratorThreeFiveCharacterRaces
