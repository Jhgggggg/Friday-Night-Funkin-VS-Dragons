function onCreate()
  
  setProperty("boyfriend.stunned",false)
  
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote) runHaxeCode('game.opponentStrums.members['..noteData..'].playAnim(\'static\', true);'); end
