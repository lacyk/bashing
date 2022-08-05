teams = ["Unicorns", "Wolves", "Pandas", "Tigers", "Penguins", "Omens"]
counter = 0

for home_team in teams:
    for away_team in teams:
        if home_team != away_team:
            print(home_team + " vs " + away_team)
            counter += 1


print(counter)
