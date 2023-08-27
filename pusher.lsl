key human2follow = "";
integer hasTarget= 0;
list FRASES = [
                "alright tails you made it!",
                "Darn we are not gonna make it! Let's speed up!",
                "Smells like trash lol!",
                "Eggman! give me the chaos emeralds!",
                "Gotta go fast!",
                "Yeah sonic speed!",
                "Take this!",
                "It's no use!!",
                "hurry tails!",
                "well done knuckle head",
                "faker!",
                "super sonic speed!"
              ];
              
list TITLES = [
                "SONIC SPEED!",
                "GOTTA GO FAST!",
                "ALRIGHT CHILLIDOG!",
                "GIVE ME THOSE EMERALDS!",
                "HEY FAKER!",
                "YOU ARE TOO SLOW!",
                "AWWW YEA"
              ];
default
{
    state_entry(){
        llSetText("SUSNIC SPEED!", <0,1,0>, 1);  
        integer listenHandle = llListen(150, "", llGetOwner(), "");
        llSetTimerEvent(0.1); 
        llStartObjectAnimation("BAILONGO");
    }    
    
    listen(integer channel, string name, key id, string msg){
        list command = llParseString2List(msg,["$"],[" "]);
        if(llList2String(command, 0) == "sonic"){
            human2follow = (key)llList2String(command, 1);
            hasTarget = 1;
        }
        if(msg == "stop"){
            hasTarget = 0;
        }
    }
    
    timer(){
        if(hasTarget == 1){
            integer j = (integer)(llFrand(llGetListLength(TITLES))+1);
           llSetText(llList2String(TITLES, j), <llFrand(1), llFrand(1), llFrand(1)>, 1);
           integer i = (integer)(llFrand(llGetListLength(FRASES))+1);
           llSay(0,llList2String(FRASES, i));
           rotation lrot= <llFrand(180), 0, llFrand(180), llFrand(180)>;
           llSetRot(lrot);
           list details = llGetObjectDetails(human2follow, [OBJECT_POS]);
           string strpos= llList2String(details, 0);
           vector pos = (vector)strpos;
           llSetPos(pos);
           if(llFrand(100)>90){
             llPlaySound("SOSNIC", 50.0 );
           }
           if(llFrand(12)>10){
               llRezObject("SANICRING", llGetPos(), <0,0,0>, <0,0,0,0>, 10);
               llPlaySound("sound2", 50.0 );
           }
         }
            llParticleSystem([
                 PSYS_PART_FLAGS,            PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK | PSYS_PART_EMISSIVE_MASK | PSYS_PART_WIND_MASK,
                 PSYS_SRC_PATTERN,           PSYS_SRC_PATTERN_ANGLE_CONE,
                 PSYS_PART_START_COLOR,      <1.0, 1.0, 1.0>,
                 PSYS_PART_END_COLOR,        <1.0, 1.0, 1.0>,
                 PSYS_PART_START_ALPHA,      1.0,
                 PSYS_PART_END_ALPHA,        0.5,
                 PSYS_PART_START_SCALE,      <0.2, 0.2, 0.0>,
                 PSYS_PART_END_SCALE,        <0.7, 0.7, 0.0>,
                 PSYS_PART_MAX_AGE,          1.0,
                 PSYS_SRC_ACCEL,             <0.0, 0.0, 0.0>,
                 PSYS_SRC_TEXTURE,           "39d85178-b5a5-6244-9a22-18c5982cab8d",
                 PSYS_SRC_BURST_RATE,        10.0 / 1,
                 PSYS_SRC_ANGLE_BEGIN,       0.0,
                 PSYS_SRC_ANGLE_END,         3 * PI,
                 PSYS_SRC_BURST_PART_COUNT,  1,
                 PSYS_SRC_BURST_RADIUS,      0.0,
                 PSYS_SRC_BURST_SPEED_MIN,   0,
                 PSYS_SRC_BURST_SPEED_MAX,   0,
                 PSYS_SRC_MAX_AGE,           8,
                 PSYS_SRC_OMEGA,             <0.0, 0.0, 0.0>
            ]);
        
    }
}
