#####################################################
# This script generates the files used by the       #
#  `BlsG1MultiOptimized` module that provides       #
#  faster scalar multiplication for the fixed-bases #
#  of the KZG Lagrange bit-reversal permutation     #
#  points. There are 4096 such points, and we       #
#  chose to precompute each of those points being   #
#  multiplied by a single digit scalar --- this     #
#  was chosen so as to try and achieve a balance    #
#  between speed and number of precomputed tables.  #
#  The benefit is that we save several doubles and  #
#  adds for most scalar multiplications.            #
#####################################################

export CRYPTOLPATH=$CRYPTOLPATH$:"../../../spec/"

# Precompute double, triple, quadruple, etc.
for (( i = 2; i <= 9; i++ ))
do
    echo "Computing points for $i"
    i_plus_1=$((i + 1))
    cat template_single_cry.txt > LagrangeBRP/Lagrange"$i".cry
    sed -i "" "s/generate_next_points/generate_points/g" LagrangeBRP/Lagrange"$i".cry
    sed -i "" "s/__MOD__/$i/g" LagrangeBRP/Lagrange"$i".cry
    sed -i "" "s/__SIZE__/$i/g" LagrangeBRP/Lagrange"$i".cry

    cryptol LagrangeBRP/Lagrange"$i".cry -c "generate_points" > points/points"$i".txt
    # Now that Cryptol has run, set up the file to be used with '__POINTS__'
    sed -i "" "s/zero/\[__POINTS__/g" LagrangeBRP/Lagrange"$i".cry

    # Remove all the lines that start with "Loading"
    sed -i "" 's/^Loading//g' points/points"$i".txt
    # Remove all the lines that start with " module"
    sed -i "" '/^ module/d' points/points"$i".txt
    # Replace the `{` from the generated Cryptol output
    sed -i "" "s/\[{/ {/g" points/points"$i".txt
    # Replace __POINTS__ placeholder with the correct value
    sed -i "" "/__POINTS__/{
        s/__POINTS__//g
        r points/points"$i".txt
    }" LagrangeBRP/Lagrange"$i".cry
done
