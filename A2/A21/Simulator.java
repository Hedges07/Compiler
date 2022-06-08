package com.company.A2.A21;

public class Simulator {
    public static boolean run(DFA dfa, String input){
        String currState = dfa.startState;
        for(int i = 0; i < input.length(); i++){
            if((currState =  dfa.transitions.get(currState+"_"+input.substring(i,i+1))) == null ){
                return false;
            }
        }
        return dfa.finalStates.contains(currState);
    }
}