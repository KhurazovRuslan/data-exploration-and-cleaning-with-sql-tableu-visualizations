-- first look at data
select *
from NashvilleHousingData..nashville_housing

-- convert SaleDate column
-- from datetime to date
ALTER TABLE NashvilleHousingData..nashville_housing
add SaleDateConv Date
update NashvilleHousingData..nashville_housing
set SaleDateConv = CONVERT(Date,SaleDate)

-- populating property address column

-- some of the rows have the same ParcelID but no PropertyAddress
select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress 
from NashvilleHousingData..nashville_housing as a
join NashvilleHousingData..nashville_housing as b
     on a.ParcelID = b.ParcelID
	 and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-- populate PropertyAddress from another row
-- with the same ParcelID
update a
set PropertyAddress = isnull(a.PropertyAddress, b.PropertyAddress)
from NashvilleHousingData..nashville_housing as a
join NashvilleHousingData..nashville_housing as b
     on a.ParcelID = b.ParcelID
	 and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-- breaking out PropertyAddress into address and city columns
-- seperate PropertyAddress on ,

-- adding new columns
ALTER TABLE NashvilleHousingData..nashville_housing
add PropertySplitAddress Nvarchar(255)
ALTER TABLE NashvilleHousingData..nashville_housing
add PropertySplitCity Nvarchar(255)

-- populating new columns
update NashvilleHousingData..nashville_housing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)
update NashvilleHousingData..nashville_housing
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


-- breaking out OwnerAddress into address, city and state columns

-- adding new columns
ALTER TABLE NashvilleHousingData..nashville_housing
add OwnerSplitAddress Nvarchar(255)
ALTER TABLE NashvilleHousingData..nashville_housing
add OwnerSplitCity Nvarchar(255)
ALTER TABLE NashvilleHousingData..nashville_housing
add OwnerSplitState Nvarchar(255)

-- populating new columns
update NashvilleHousingData..nashville_housing
set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'),3)
update NashvilleHousingData..nashville_housing
set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'),2)
update NashvilleHousingData..nashville_housing
set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'),1)

-- updating Y and N to Yes and No in SoldAsVacant
-- using case statement
update NashvilleHousingData..nashville_housing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
     when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end

-- remove duplicates using CTE
with RowNum as (
select *, ROW_NUMBER() over (
          partition by ParcelID,
		               PropertyAddress,
					   SalePrice,
					   SaleDate,
					   LegalReference
					   order by UniqueID
) row_num
from NashvilleHousingData..nashville_housing
)

delete 
from RowNum
where row_num <> 1

-- deleting unused columns
alter table NashvilleHousingData..nashville_housing
drop column PropertyAddress, SaleDate, OwnerAddress, TaxDistrict

select *
from NashvilleHousingData..nashville_housing

