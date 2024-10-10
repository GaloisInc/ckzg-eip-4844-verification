####################################################
# This script generates the files used by the      #
#  `BlsG1MultiOptimized` module that provides fast #
#  scalar multiplication for the fixed-bases of    #
#  the KZG Lagrange bit-reversal permutation       #
#  points. There are 4096 such points, and we      #
#  chose to precompute each of those points being  #
#  doubled in multiples of a chosen base.          #
#  The benefit is greatest for scalars at or just  #
#  greater than these precompute multiples.        #
####################################################

export CRYPTOLPATH=$CRYPTOLPATH$:"../../../spec/"

echo "Computing points for 2^229"
# Run Cryptol to generate the precomputed points for the specificed scalar
cryptol LagrangeBRP/Lagrange4096pow19.cry -c "generate_next_points" > points/points2pow229.txt
# Remove all the lines that start with "Loading"
sed -i "" 's/^Loading//g' points/points2pow229.txt
# Remove all the lines that start with " module"
sed -i "" '/^ module/d' points/points2pow229.txt
# Replace the `{` from the generated Cryptol output
sed -i "" "s/\[{/ {/g" points/points2pow229.txt

base=2
loop_start=229
loop_end=253
# NOTE: There is no reason to go above 2^253, because of the other optimization
#  found in the check for `scalar >= `(BLS_MODULUS) / 2` in `g1_multi_with_table`.

# Now redo the process above for all the base^i files
for (( i = $loop_start; i <= $loop_end; i++ ))
do
    var=$(echo $base^$i | bc)
    text="$base""pow""$i"

    cat template_pow_cry.txt > LagrangeBRP/Lagrange"$text".cry
    sed -i "" "s/__MOD__/$text/g" LagrangeBRP/Lagrange"$text".cry
    sed -i "" "s/__SIZE__/$base/g" LagrangeBRP/Lagrange"$text".cry

    # Add the previously generated points into the specified LagrangeN.cry file
    sed -i "" "/__POINTS__/{
        s/__POINTS__//g
        r points/points"$text".txt
    }" LagrangeBRP/Lagrange"$text".cry

    next_i=$(($i+1))
    next_text="$base""pow""$next_i"

    if [ $i -lt $loop_end ]; then
        echo "Computing points for $base^$next_i"
        cryptol LagrangeBRP/Lagrange"$text".cry -c "generate_next_points" > points/points"$next_text".txt
        # Remove all the lines that start with "Loading"
        sed -i "" 's/^Loading//g' points/points"$next_text".txt
        # Remove all the lines that start with " module"
        sed -i "" '/^ module/d' points/points"$next_text".txt
        # Replace the `{` from the generated Cryptol output
        sed -i "" "s/\[{/ {/g" points/points"$next_text".txt
    fi
done
