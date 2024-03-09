using econcensus, Serialization, Chain
const datap = "../econdata"
const dataf = "ECNBASIC2022/ECNBASIC2022.EC2200BASIC-Data.csv"

readdir(datap)
readdir(joinpath(datap, "ECNBASIC2022"))

@chain begin
    readbasic(datap, dataf)
    serialize(joinpath(datap, chop(dataf, tail = 4)*".serial"), _)
end

const serialdf =  "ECNBASIC2022/ECNBASIC2022.EC2200BASIC-Data.serial"
inspectbasic(datap, serialdf)

exit()
