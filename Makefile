Target := gtt

GameObjectSources:=	sources/GameObject/GameObject.cpp \

EntitySources:= sources/Entity/Archer.cpp \
								sources/Entity/BasicMonster.cpp \
								sources/Entity/EnnemyEntity.cpp \
								sources/Entity/PlayableEntity.cpp \
								sources/Entity/Entity.cpp \
								sources/Entity/Boss.cpp \
								sources/Entity/Wizard.cpp \
								sources/Entity/Guardian.cpp \
								sources/Entity/Warrior.cpp \
								sources/Entity/Healthbar.cpp \

GUISources:= 		sources/Events/EventHandler.cpp \
								sources/Events/Joystick.cpp \
								sources/Events/KeyInput.cpp \
								sources/Gui/GeneralGUI.cpp \

FeaturesSources:= sources/Features/Score.cpp \
									sources/Features/Settings.cpp \
									sources/Features/SettingsType.cpp \

RessSources:= 	sources/RessourceManager/Models3DManager.cpp \
								sources/RessourceManager/Model3D.cpp \
								sources/RessourceManager/FontsManager.cpp \
								sources/RessourceManager/Font.cpp \
								sources/RessourceManager/AudioManager.cpp \
								sources/RessourceManager/Audio.cpp \
								sources/RessourceManager/TextureManager.cpp \
								sources/RessourceManager/Texture.cpp \

CoreSources:= sources/Core/Core.cpp \
							sources/Core/RessourcesManager.cpp \
							sources/Core/GUI.cpp \

IASources:= sources/IA/IA.cpp \

SpawnManagerSources:= sources/SpawnManager/SpawnManager.cpp \

Sources := 	sources/main.cpp \
						$(GUISources) \
						$(CoreSources) \
						$(RessSources) \
						$(FeaturesSources) \
						$(EntitySources) \
						$(IASources) \
						$(GameObjectSources) \
						$(SpawnManagerSources) \
						sources/Menu/Menu.cpp \
						sources/Projectil/Fireball.cpp \
						sources/SplashScreen/SplashScreen.cpp\

Headers := -I./sources/Events/ -I./sources/ -I./sources/Gui/ -I./sources/RessourceManager/ -I./sources/Projectil/ -I./sources/Core/ -I./sources/Features/ -I./sources/Entity/ -I./sources/IA/ -I./sources/Menu/ -I./sources/Audio/ -I/usr/include/python2.7

Objs := $(Sources:.cpp=.o)

IrrlichtHome := ./libraries/irrlicht

USERCPPFLAGS =

USERCXXFLAGS = -O3 -ffast-math $(Headers) -std=c++17 -g3
USERLDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

CPPFLAGS = -I$(IrrlichtHome)/include -I/usr/X11R6/include $(USERCPPFLAGS)
CXXFLAGS = $(USERCXXFLAGS)
LDFLAGS = $(USERLDFLAGS)

all: $(Target)

# target specific settings
$(Target): LDFLAGS += -L$(IrrlichtHome)/lib/linux -lIrrlicht
$(Target): LDFLAGS += -L/usr/X11R6/lib64 -lGL -lXxf86vm -lXext -lX11 -lXcursor -lpython2.7

$(Target): $(Objs)
	$(warning Building...)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(Objs) -o $(Target) $(LDFLAGS)

clean:
	@$(RM) $(Objs)

fclean: clean
	$(warning Cleaning...)
	@$(RM) $(Target)

re: fclean all

.PHONY: all clean fclean re
