function out = terr_assess(assess)
nans = isnan(assess);
assess(nans) = [];

z = sum(assess)/length(assess);
z = z - floor(z);

if z < 0.5
    out = floor(sum(assess)/length(assess));
else
    out = ceil(sum(assess)/length(assess));
end
end