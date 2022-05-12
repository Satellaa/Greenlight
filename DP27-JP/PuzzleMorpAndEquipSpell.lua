--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN,5)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck (yours)
Debug.AddCard(25165047,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(25165047,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(48712195,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(7817703,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(48712195,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(7817703,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(7817703,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(48712195,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(2250266,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(7817703,0,0,LOCATION_DECK,0,POS_FACEDOWN)


Debug.AddCard(48712195,0,0,LOCATION_DECK,0,POS_FACEDOWN)

--Hand (yours)
Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(59160188,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100428007,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(5318639,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(45593005,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--GY (yours)
Debug.AddCard(45593005,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(8487449,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(22398665,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(15521027,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(2250266,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(57108202,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(8487449,0,0,LOCATION_GRAVE,0,POS_FACEUP)

--Monster Zones (yours)
Debug.AddCard(2403771,0,0,LOCATION_MZONE,5,POS_FACEUP_ATTACK,true)
Debug.AddCard(2403771,1,1,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
Debug.AddCard(2403771,0,0,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
Debug.AddCard(2403771,0,0,LOCATION_MZONE,3,POS_FACEUP_ATTACK,true)
Debug.AddCard(2403771,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(25165047,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(25165047,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(100428001,0,0,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)
Debug.AddCard(100428001,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)

Debug.ReloadFieldEnd()
aux.BeginPuzzle()