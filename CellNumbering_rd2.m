function[cellNoTbl] = CellNumbering_rd2 (allTbl,lowestTimeIndex)
%add a variable cell No. to allTbl initialized at 0
cellNoTbl = allTbl;
cellNoTbl.cellNo = zeros(size(allTbl,1),1);

cellCounter = 1; %variable to increase when counting cells

%add cell numbers to the cellNo variable col of table
for i = 1: size(cellNoTbl, 1) %loop through each row  
   cellNoTbl.cellNo(i) = cellCounter;
   %increment cell Counter if timeInd resets to one on next i
   if i == size(cellNoTbl,1)
       break
   end
   if cellNoTbl.timeInd(i+1) == lowestTimeIndex
       cellCounter = cellCounter +1;
   end
end

[~,folder_name] = fileparts(pwd); %gets folder name
writetable(cellNoTbl,[folder_name,'AllTblwcellNos_314','.xlsx']); %saves table

end
